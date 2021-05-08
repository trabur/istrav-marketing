<script>
	import { onMount } from "svelte";

  import Block from './Blocks/Block.svelte'
  import SplashPage1 from './Wireframes/SplashPage1.svelte'
  import SplashPage2 from './Wireframes/SplashPage2.svelte'
  import MasterDetail1 from './Wireframes/MasterDetail1.svelte'
	const views = {
    SplashPage1,
    SplashPage2,
    MasterDetail1
  }

	import SvelteMarkdown from 'svelte-markdown'

	export let app
  export let slug

	let page

	onMount(async () => {
    let esPage = await scripts.app.pages.getOne(app.id, slug)
		console.log('esPage', esPage)
    if (esPage.payload.success === true) {
      page = esPage.payload.data
      updateViewportComponent(page.wireframe)
    } else {
      alert(esPage.payload.reason)
    }
	})

  // load wireframe component
	let viewportComponent = null
	function updateViewportComponent(id) {
		viewportComponent = views[id]
	}

</script>


<svelte:head>
	{#if page && page.name}
		<title>{page.name}</title>
	{/if}
</svelte:head>

<!-- wireframes -->
<svelte:component this={viewportComponent} showWiring={true}>
  <section slot="logo" class="slot">
    {#each page.slots.logoSlot as block(block.id)}
      <Block {app} {page} {block} />
    {/each}
  </section>
  <section slot="slogan" class="slot">
    {#each page.slots.sloganSlot as block(block.id)}
      <Block {app} {page} {block} />
    {/each}
  </section>
  <section slot="controls" class="slot">
    {#each page.slots.controlsSlot as block(block.id)}
      <Block {app} {page} {block} />
    {/each}
  </section>
  <section slot="navigation" class="slot">
    {#each page.slots.navigationSlot as block(block.id)}
      <Block {app} {page} {block} />
    {/each}
  </section>
  <section slot="article" class="slot">
    {#each page.slots.articleSlot as block(block.id)}
      <Block {app} {page} {block} />
    {/each}
  </section>
  <section slot="aside" class="slot">
    {#each page.slots.asideSlot as block(block.id)}
      <Block {app} {page} {block} />
    {/each}
  </section>
  <section slot="main" class="slot">
    {#each page.slots.mainSlot as block(block.id)}
      <Block {app} {page} {block} />
    {/each}
  </section>
  <section slot="footer" class="slot">
    {#each page.slots.footerSlot as block(block.id)}
      <Block {app} {page} {block} />
    {/each}
  </section>
</svelte:component>


<div class="row page">
  <div class="col s0 m1"></div>
  <div class="col s12 m10">
    {#if page && page.content}
      <br class="hide-on-med-and-down" />
      <br class="hide-on-med-and-down" />
      <br />
      <SvelteMarkdown source={page.content} />
      <br class="hide-on-med-and-down" />
      <br class="hide-on-med-and-down" />
      <br />
    {/if}
  </div>
  <div class="col s0 m1"></div>
</div>

<style>
  .page {
    background-color: #eee;
    color: #333;
    min-height: 100vh;
    margin: 0;
  }

</style>