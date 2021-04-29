<script>
  import { onMount } from 'svelte';

  import TawkToChatWidget from './TawkToChatWidget.svelte'
  import GoogleAnalytics from './GoogleAnalytics.svelte'

  export let esApp
  export let appId
  export let domainId

  export let coverBackColor
  export let coverTextColor
  export let labelName 
  export let labelAbout
  export let labelPrimaryOffering
  
  let propertyId = esApp.tawkToPropertyId // || '6051205af7ce18270930caec'
  let chatId = esApp.tawkToChatId // || '1f0ueco46'
  let measurementId = esApp.googleAnalyticsMeasurementId // || 'G-M6CKY68372'
  let items = []

	onMount(async () => {    
    // get the menus
    let esNavigation = await scripts.app.menus.getOne(appId, 'marketing')
    if (esNavigation.payload.success === true) {
      items = JSON.parse(esNavigation.payload.data.raw)
    } else {
      console.log(esNavigation.payload.reason)
    }
    console.log('main menu', items)
  })
</script>

{#if propertyId && chatId}
  <TawkToChatWidget propertyId={propertyId} chatId={chatId} />
{/if}
{#if measurementId}
  <GoogleAnalytics measurementId={measurementId} />
{/if}

<footer class="page-footer" style={`background-color: ${coverBackColor}; color: ${coverTextColor}`}>
  <div class="container">
    <div class="row">
      <div class="col l6 s12">
        <h5 class="white-text">{labelName || 'ISTRAV'}</h5>
        <p class="grey-text text-lighten-4">{labelAbout || ''}</p>
      </div>
      <div class="col l4 offset-l2 s12">
        <h5 class="white-text">{labelPrimaryOffering || 'Web Solutions'}</h5>
        {#if items.length > 0}
          <ul>
            {#each items as nav}
              <li><a class="grey-text text-lighten-3" href={nav.url}>{nav.name}</a></li>
            {/each}
          </ul>
        {/if}
      </div>
    </div>
  </div>
  <div class="footer-copyright">
    <div class="container">
      Copyright @{new Date().getFullYear()} <a href={`https://${domainId}`}>{domainId}</a>. All Rights Reserved. Powered by <a href="https://istrav.com" target="_blank">ISTRAV</a>.
    </div>
  </div>
</footer>

<style>
  .footer-copyright {
    background-color: rgba(0,0,0,0.1);
  }
</style>