<script>
	import { onMount } from "svelte";

	import SvelteMarkdown from 'svelte-markdown'

	export let appId
  export let slug
  // export let uploads
  // export let coverBackColor
  // export let coverTextColor
  // export let primaryBtnBackColor
  // export let primaryBtnTextColor
  // export let secondaryBtnBackColor
  // export let secondaryBtnTextColor
  // export let marketing
  // export let labelName
  // export let labelShort
  // export let labelEmail
  // export let labelAbout
  // export let labelSloganLine1
  // export let labelSloganLine2
  // export let labelPrimaryOffering

	let page
  let name
  let content

	onMount(async () => {
    let esPage = await scripts.app.pages.getOne(appId, slug)
		console.log('esPage', esPage)
    if (esPage.payload.success === true) {
      page = esPage.payload.data
      name = page.name
      content = page.content

    } else {
      alert(esPage.payload.reason)
    }
	})
</script>


<svelte:head>
	{#if name}
		<title>{name}</title>
	{/if}
</svelte:head>

<div class="row page">
  <div class="col s0 m1"></div>
  <div class="col s12 m10">
    {#if content}
      <br class="hide-on-med-and-down" />
      <br class="hide-on-med-and-down" />
      <br />
      <SvelteMarkdown source={content} />
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