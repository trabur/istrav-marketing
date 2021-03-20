<script>
  import { onMount } from "svelte";

	onMount(() => {
		/* particlesJS.load(@dom-id, @path-json, @callback (optional)); */
		particlesJS.load('particles-js', './particles.json', function() {
			console.log('callback - particles.js config loaded');
		});
	})
</script>

<svelte:head>
	<title>The platform for web services - ISTRAV</title>
</svelte:head>

<div class="masonry">
	<div id="particles-js">
		<div class="middle">
			<div class="logo">
				<span style="font-size: 3em; margin: 0 -0.1em;">IS</span>
				<span style="vertical-align: top; font-size: 1.5em; line-height: 2.3em;">TRAV</span>
			</div>
			<h1 class="slogan">The platform for<br />web services.</h1>
		</div>
	</div>
</div>
<div class="masonry">
	<div id="platform">
		
	</div>
</div>

<style>
	.masonry {
		height: 100vh;
		position: relative;
	}

	.middle {
    width: 100%;
    position: absolute;
    top: 50%;
    -ms-transform: translateY(-50%);
    transform: translateY(-50%);
	}

	.logo {
		margin: -1em 0 0 0;
		font-size: 4em;
		font-weight: 800;
		text-align: center;
		font-style: italic;
	}

	.slogan {
		font-weight: 600;
		text-align: center;
		margin-top: -1em;
    font-size: 2.5em;
	}

	#platform {
		background-color: #111;
		overflow: hidden;
		position: absolute;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
	}

	#particles-js {
		background-color: #ee6e73;
		overflow: hidden;
		position: absolute;
		top: 0;
		right: 0;
		bottom: 0;
		left: 0;
	}
</style>