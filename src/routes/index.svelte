<script>
  import { onMount } from "svelte";
	import * as animateScroll from "svelte-scrollto"

	import Solutions from '../components/Solutions.svelte'
	import Nav from '../components/Nav.svelte'

	onMount(() => {
		/* particlesJS.load(@dom-id, @path-json, @callback (optional)); */
		particlesJS.load('particles-js', './particles.json', function() {
			console.log('callback - particles.js config loaded');
		});
	})
</script>

<svelte:head>
	<title>ISTRAV: Web solutions and custom software.</title>
</svelte:head>

<div class="masonry">
	<div id="particles-js">
		<div class="middle">
			<div class="logo">
				<span style="font-size: 3em; margin: 0 -0.1em;">IS</span>
				<span style="vertical-align: top; font-size: 1.5em; line-height: 2.3em;">TRAV</span>
			</div>
			<h1 class="slogan">Web solutions<br />and custom software.</h1>
			<div class="expand">
				<a href="/#" class="btn-floating btn-large waves-effect waves-light" on:click={() => animateScroll.scrollTo({element: '#platform'})}>
					<i class="material-icons">expand_more</i>
				</a>
			</div>
		</div>
	</div>
</div>
<Nav />
<div id="platform">
	<Solutions />
</div>
<div class="dotted">
	<div style="min-height: 100vh;"></div>
</div>


<style>
	.masonry {
		min-height: 100vh;
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
		color: #333;
	}

	.slogan {
		font-weight: 600;
		text-align: center;
		margin-top: -1em;
    font-size: 2.5em;
		color: #333;
	}

	#platform {
		background-color: #333;
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

	.expand {
		text-align: center;
	}

	.dotted {
		background-image: radial-gradient(#ddd 20%, transparent 20%), radial-gradient(#ddd 20%, transparent 20%);
    background-color: #eee;
    background-position: 0 0, 50px 50px;
    background-size: 100px 100px;
	}
</style>