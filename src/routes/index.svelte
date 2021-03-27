<script>
  import { onMount } from "svelte";
	import * as animateScroll from "svelte-scrollto"

	import Solutions from '../components/Solutions.svelte'
	import Nav from '../components/Nav.svelte'

  let esApp
  let appId
  let domainId
  let state = 'production'
  let uploads
  let rawApp = {
    name: '',
    short: ''
  }

	onMount(async () => {
		/* particlesJS.load(@dom-id, @path-json, @callback (optional)); */
		particlesJS.load('particles-js', './particles.json', function() {
			console.log('callback - particles.js config loaded');
		});

    domainId = window.location.host

    // pick an app to show for local development
    if (domainId.includes('localhost:3000')) {
      domainId = 'istrav.com'
    }
    // set appId from domain 
    if (domainId.includes('tyu67.com')) {
      // for subdomains such as http://istrav.tyu67.com
      let endpoint = domainId.split('.')[0]
      let esEndpoint = await scripts.tenant.apps.getEndpoint(null, endpoint)
      if (esEndpoint.payload.success === true) {
        esApp = esEndpoint.payload.data
        appId = esEndpoint.payload.data.id
        uploads = esEndpoint.payload.data.uploads
        rawApp = JSON.parse(esEndpoint.payload.data.raw)
        domainId = esEndpoint.payload.data.domain // do this so images load
      } else {
        alert(esEndpoint.payload.reason)
      }
    } else {
      // for custom domains such as https://istrav.com
      domainId = domainId.split('.').slice(-2).join('.')
      let esOne = await scripts.tenant.apps.getOne(null, domainId, state)
      if (esOne.payload.success === true) {
        esApp = esOne.payload.data
        appId = esOne.payload.data.id
        uploads = esOne.payload.data.uploads
        rawApp = JSON.parse(esOne.payload.data.raw)
      } else {
        alert(esOne.payload.reason)
      }
    }
	})

	// AAGHC
	let show = false
	function showMagic () {
		show = true
	}
	function hideMagic () {
		show = false
	}
</script>

<svelte:head>
	{#if rawApp && rawApp.name}
		<title>{rawApp.name}: {rawApp.sloganLine1} {rawApp.sloganLine2}</title>
	{/if}
</svelte:head>

<div class="masonry">
	<div id="particles-js">
		<div class="middle">
			{#if domainId === 'istrav.com'}
				<div class="logo">
					<span style="font-style: italic; font-size: 3em; margin: 0 -0.1em;">IS</span>
					<span style="font-style: italic; vertical-align: top; font-size: 1.5em; line-height: 2.3em;">TRAV</span>
				</div>
			{:else if domainId === 'aaghc.com'}
				<div class="aaghc" on:mouseenter={showMagic} on:mouseleave={hideMagic}>
					{#if show}
						AAGHC
					{:else}
						<div class="first-a">A</div><div class="second-a">A</div><div class="third-g">G</div><div class="rotate-letter">H</div><div class="space-letter">C</div>
					{/if}
				</div>
			{:else}
				<div class="logo">
					<span style="font-size: 1.5em; line-height: 2em;">{rawApp.name || ''}</span>
				</div>
			{/if}
			{#if rawApp}
				<h1 class="slogan">{rawApp.sloganLine1 || ''}<br />{rawApp.sloganLine2 || ''}</h1>
			{/if}
			<div class="expand">
				<a href="/#" class="btn-floating btn-large waves-effect waves-light" on:click={() => animateScroll.scrollTo({element: '#jump-here'})}>
					<i class="material-icons">expand_more</i>
				</a>
			</div>
		</div>
	</div>
</div>

<div id="jump-here"></div>
<Nav selected='marketing' appId={appId} />
<div class="platform">
	{#if domainId === 'istrav.com'}
		<Solutions />
	{/if}
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
		color: #333;
	}

	.slogan {
		font-weight: 600;
		text-align: center;
		margin-top: -1em;
    font-size: 2.5em;
		color: #333;
	}

	.platform {
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

	.aaghc {
		margin: 0 auto;
		font-size: 5em;
		font-weight: 800;
		text-align: center;
		font-family: sans-serif;
		color: #333;
		cursor: pointer;
		display: table;
	}

	.aaghc .first-a {
		float: left;
	}

	.aaghc .second-a {
		margin-left: -0.2em;
		float: left;
	}

	.aaghc .third-g {
		margin-right: 0.1em;
		float: left;
	}

	.aaghc .rotate-letter {
		transform: rotate(-90deg);
		float: left;
	}

	.aaghc .space-letter {
		float: left;
	}
</style>