
<script>
  import { onMount } from 'svelte';

	import { appData } from '../stores.js';
  import { istrav, scripts } from '../../farmerless/api'

  import Page from '../../farmerless/components/Page.svelte'

  import { getStores, navigating, page, session } from '$app/stores';

  // When this is true, show the component
  let load = false

  let slug

  let app
  appData.subscribe(value => {
    app = value
    console.log(app)
  })

  $: { reMount($page.params.slug) }
  // $: { reMount($page.params.state) }
  function reMount(s) {
    load = false
    setTimeout(() => load = true, 0)
    slug = s
    // state = $page.params.state
  }
</script>

{#if load && app.id}
	{#if app.marketing}
  	<Page {app} slug={app.marketing.slug} />
	{:else}
		<Page {app} slug={'homepage'} />
	{/if}
{/if}