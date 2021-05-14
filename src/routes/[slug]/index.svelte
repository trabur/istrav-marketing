
<script>
  import { onMount } from 'svelte';

  import Page from '../../components/Page.svelte'

  import { getStores, navigating, page, session } from '$app/stores';

  // When this is true, show the component
  let load = false
  let slug

  let app
  let domainId
  let state = 'production'
  let scripts = window['scripts']

  $: { reMount($page.params.slug) }
  // $: { reMount($page.params.state) }
  function reMount(s) {
    load = false
    setTimeout(() => load = true, 0)
    slug = s
    // state = $page.params.state
  }

	onMount(async () => {
    domainId = window.location.host

    // pick an app to show for local development
    if (domainId.includes('localhost:8000')) {
      domainId = 'istrav.com'
    }
    // set appId from domain 
    if (domainId.includes('tyu67.com')) {
      // for subdomains such as http://istrav.tyu67.com
      let endpoint = domainId.split('.')[0]
      if (endpoint === 'www') {
        endpoint = 'tyu67'
      }
      let esEndpoint = await scripts.tenant.apps.getEndpoint(null, endpoint)
      if (esEndpoint.payload.success === true) {
        app = esEndpoint.payload.data
      } else {
        alert(esEndpoint.payload.reason)
      }
    } else {
      // for custom domains such as https://istrav.com
      domainId = domainId.split('.').slice(-2).join('.')
      let esOne = await scripts.tenant.apps.getOne(null, domainId, state)
      if (esOne.payload.success === true) {
        app = esOne.payload.data
      } else {
        alert(esOne.payload.reason)
      }
    }
		console.log('app', app)
	})

</script>

{#if load && app}
  <Page {app} {slug} />
{/if}