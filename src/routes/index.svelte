<script>
  import { onMount } from "svelte";
	import * as animateScroll from "svelte-scrollto"

	import Solutions from '../components/Solutions.svelte'
	import Nav from '../components/Nav.svelte'
	import Footer from '../components/Footer/Main.svelte'
	import OpenSource from '../components/OpenSource.svelte'
	import GetStarted from '../components/GetStarted.svelte'

  let esApp
  let appId
  let domainId
  let state = 'production'
  let uploads

	let coverBackColor
	let coverTextColor
	let primaryBtnBackColor
	let primaryBtnTextColor
	let secondaryBtnBackColor
	let secondaryBtnTextColor

	let marketing

	let labelName
	let labelShort
	let labelEmail
	let labelAbout
	let labelSloganLine1
	let labelSloganLine2
	let labelPrimaryOffering

	let logo

	onMount(async () => {
		/* particlesJS.load(@dom-id, @path-json, @callback (optional)); */
		particlesJS.load('particles-js', './particles.json', function() {
			console.log('callback - particles.js config loaded');
		});

    domainId = window.location.host

    // pick an app to show for local development
    if (domainId.includes('localhost:8000')) {
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
        domainId = esEndpoint.payload.data.domain // do this so images load
				
				coverBackColor = esApp.coverBackColor
				coverTextColor = esApp.coverTextColor
				primaryBtnBackColor = esApp.primaryBtnBackColor
				primaryBtnTextColor = esApp.primaryBtnTextColor
				secondaryBtnBackColor = esApp.secondaryBtnBackColor
				secondaryBtnTextColor = esApp.secondaryBtnTextColor

				marketing = esApp.marketing

				labelName = esApp.labelName
				labelShort = esApp.labelShort
				labelEmail = esApp.labelEmail
				labelAbout = esApp.labelAbout
				labelSloganLine1 = esApp.labelSloganLine1
				labelSloganLine2 = esApp.labelSloganLine2
				labelPrimaryOffering = esApp.labelPrimaryOffering

				logo = esApp.logo
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

				coverBackColor = esApp.coverBackColor
				coverTextColor = esApp.coverTextColor
				primaryBtnBackColor = esApp.primaryBtnBackColor
				primaryBtnTextColor = esApp.primaryBtnTextColor
				secondaryBtnBackColor = esApp.secondaryBtnBackColor
				secondaryBtnTextColor = esApp.secondaryBtnTextColor

				marketing = esApp.marketing

				labelName = esApp.labelName
				labelShort = esApp.labelShort
				labelEmail = esApp.labelEmail
				labelAbout = esApp.labelAbout
				labelSloganLine1 = esApp.labelSloganLine1
				labelSloganLine2 = esApp.labelSloganLine2
				labelPrimaryOffering = esApp.labelPrimaryOffering

				logo = esApp.logo
      } else {
        alert(esOne.payload.reason)
      }
    }
		console.log('esApp', esApp)
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
	{#if labelName}
		<title>{labelName}: {labelSloganLine1} {labelSloganLine2}</title>
	{/if}
</svelte:head>

<div class="masonry">
	<div id="particles-js" style={`background-color: ${coverBackColor}; color: ${coverTextColor}`}>
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
				{#if logo}
					<img class="logo-image" src={`${uploads}/${logo}`} alt="logo" />
					<br />
					<br />
					<br />
				{:else}
					<div class="logo">
						<span style="font-size: 1.5em; line-height: 2em;">{labelName || 'SETUP'}</span>
					</div>
				{/if}
			{/if}
			{#if labelName}
				<h1 class="slogan">{labelSloganLine1}<br />{labelSloganLine2}</h1>
				<div class="expand">
					<a href="/#" class={`btn-floating btn-large waves-effect waves-light ${secondaryBtnBackColor} ${secondaryBtnTextColor}`} on:click={() => animateScroll.scrollTo({element: '#jump-here'})}>
						<i class="material-icons">expand_more</i>
					</a>
				</div>
			{:else}
				<div class="expand">
					<a href="https://metaheap.io" class={`btn-floating btn-large waves-effect waves-light ${secondaryBtnBackColor} ${secondaryBtnTextColor}`}>
						<i class="material-icons">lock</i>
					</a>
				</div>
			{/if}
		</div>
	</div>
</div>

{#if appId}
	<div id="jump-here"></div>
	<Nav selected='marketing' {appId} {primaryBtnBackColor} {primaryBtnTextColor} {secondaryBtnBackColor} {secondaryBtnTextColor} />
	<GetStarted appId={appId} uploads={uploads} domainId={domainId} {marketing} />
	{#if domainId === 'istrav.com'}
		<Solutions />
		<OpenSource appId={appId}  />
	{/if}
	<Footer appId={appId} esApp={esApp} domainId={domainId} {coverBackColor} {coverTextColor} {labelName} {labelAbout} {labelPrimaryOffering} />
{/if}

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
		text-align: center;
	}

	.logo {
		margin: -1em 0 0 0;
		font-size: 4em;
		font-weight: 800;
		text-align: center;
	}

	.logo-image {
		margin: 0;
		height: 200px;
	}

	.slogan {
		font-weight: 600;
		text-align: center;
		margin-top: -1em;
    font-size: 2.5em;
	}

	#particles-js {
		background-color: #ee6e73;
		color: #333;
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

	.aaghc {
		margin: 0 auto;
		font-size: 5em;
		font-weight: 800;
		text-align: center;
		font-family: sans-serif;
		color: #333;
		cursor: pointer;
		display: table;
    line-height: 2em;
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