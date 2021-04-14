<script>
	import { onMount } from "svelte";
	import SlideShow from "./SlideShow.svelte";

	export let appId
	export let uploads
	export let domainId
	let guide

	onMount(async () => {
    let esGuide = await scripts.channel.guides.getOne(appId, 'welcome')
		console.log('esGuide', esGuide)
    if (esGuide.payload.success === true) {
      guide = esGuide.payload.data
    } else {
      alert(esGuide.payload.reason)
    }
	})
</script>


<div class="announce">
	<br class="hide-on-med-and-down" />
	<br class="hide-on-med-and-down" />
	<br />

	<h1 class="title">Getting Started:</h1>
	<div class="row">
		<div class="col s0 m1"></div>
		<div class="col s12 m10">
			<p class="description">Hello, and welcome to ISTRAV! Thank you for taking the time to consider us as your next web solutions and custom software teammate. The following series of videos is our conversion funnel for launching websites into production at rocket speeds. Please give yourself a moment to watch them, browse our bog, and checkout our community. Got questions? Jump into the FAQ, contact us by email, or take advantage of our live chat. When you succeed we succeed. So we hope you are excited just as much as we are; let's get started!</p>
		</div>
		<div class="col s0 m1"></div>
	</div>
	<SlideShow uploads={uploads} guide={guide} domainId={domainId} />

	<br class="hide-on-med-and-down" />
	<br class="hide-on-med-and-down" />
	<br />
</div>

<style>

	.title {
		color: #fff;
    text-align: center;
    font-size: 3em;
    font-weight: 100;
	}

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

