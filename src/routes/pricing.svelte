<script>
  import { onMount } from "svelte";
	import Nav from '../components/Nav.svelte'
	import Footer from '../components/Footer/Main.svelte'

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
		console.log('esApp', esApp)
	})
</script>

<svelte:head>
	{#if rawApp && rawApp.name}
		<title>Pricing - {rawApp.name}: {rawApp.sloganLine1} {rawApp.sloganLine2}</title>
	{/if}
</svelte:head>

{#if appId}
	<Nav selected='marketing.pricing' appId={appId} />
	<div class="dotted">
		<div style="min-height: 100vh;">
			:)
		</div>
	</div>
	<Footer appId={appId} esApp={esApp} rawApp={rawApp} domainId={domainId} />
{/if}

<style>
	.dotted {
		background-image: radial-gradient(#ddd 20%, transparent 20%), radial-gradient(#ddd 20%, transparent 20%);
    background-color: #eee;
    background-position: 0 0, 50px 50px;
    background-size: 100px 100px;
	}
</style>