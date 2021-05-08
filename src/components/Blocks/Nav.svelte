<script>
  import { onMount } from 'svelte';

	export let selected
  export let appId

	export let primaryBtnBackColor
	export let primaryBtnTextColor
	export let secondaryBtnBackColor
	export let secondaryBtnTextColor

  let items = []

	onMount(async () => {    
    // get the menus
    let esNavigation = await scripts.app.menus.getOne(appId, 'main')
    if (esNavigation.payload.success === true) {
      items = JSON.parse(esNavigation.payload.data.raw)
    } else {
      console.log(esNavigation.payload.reason)
    }
    console.log('main menu', items)
  })
</script>

{#if items.length > 0}
	<div class="nav">
		{#each items as nav}
			{#if nav.id === selected}
				<a href={nav.url} class={`btn-large waves-effect waves-light ${primaryBtnBackColor} ${primaryBtnTextColor}`}>
					{nav.name}
				</a>
			{:else}
				<a href={nav.url} class={`btn-large waves-effect waves-light ${secondaryBtnBackColor} ${secondaryBtnTextColor}`}>
					{nav.name}
				</a>
			{/if}
		{/each}
	</div>
{/if}

<style>
  .nav {
    padding: 1em;
    text-align: center;
    background-color: #111;
  }

  .nav a {
    margin: 0.5em;
  }
</style>

