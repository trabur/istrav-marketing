<script>
	import { onMount } from "svelte";

	import SvelteMarkdown from 'svelte-markdown'
	import SlideShow from "./SlideShow.svelte";

	export let appId
	export let uploads
	export let domainId
	export let marketing
	let guide

	onMount(async () => {
		if (marketing) {
			let esGuide = await scripts.channel.guides.getOne(appId, 'welcome')
			console.log('esGuide', esGuide)
			if (esGuide.payload.success === true) {
				guide = esGuide.payload.data
			} else {
				alert(esGuide.payload.reason)
			}
		}
	})
</script>


{#if marketing}
	<div class="announce">
		<br class="hide-on-med-and-down" />
		<br class="hide-on-med-and-down" />
		<br />

		<!-- <h1 class="title">Getting Started:</h1> -->
		<div class="row">
			<div class="col s0 m1"></div>
			<div class="col s12 m10 description">
				<SvelteMarkdown source={marketing.content} />
			</div>
			<div class="col s0 m1"></div>
		</div>
		<SlideShow uploads={uploads} guide={guide} domainId={domainId} />
		
		<br class="hide-on-med-and-down" />
		<br class="hide-on-med-and-down" />
		<br />
	</div>
{/if}

<style>

	/* .title {
		color: #fff;
    text-align: center;
    font-size: 3em;
    font-weight: 100;
	} */

  .description {
		margin-top: 0;
    color: #aaa;
    font-size: 1.5em;
  }

	.announce {
		background-color: #222;
		padding: 1em;
	}
</style>

