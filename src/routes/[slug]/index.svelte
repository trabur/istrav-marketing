
<script>
  import { onMount } from 'svelte';

  import Page from '../../components/Page.svelte'
	import Nav from '../../components/Nav.svelte'
	import Footer from '../../components/Footer/Main.svelte'

  import { stores } from "@sapper/app"
  const { page } = stores()

  // When this is true, show the component
  let load = false
  let slug

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

  $: { reMount($page.params.slug) }
  // $: { reMount($page.params.state) }
  function reMount() {
    load = false
    setTimeout(() => load = true, 0)
    slug = $page.params.slug
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
      } else {
        alert(esOne.payload.reason)
      }
    }
		console.log('esApp', esApp)
	})

</script>

{#if appId}
  <Nav selected='' {appId} {primaryBtnBackColor} {primaryBtnTextColor} {secondaryBtnBackColor} {secondaryBtnTextColor} />
  <Page {appId} {slug} {uploads} {coverBackColor} {coverTextColor} {primaryBtnBackColor} {primaryBtnTextColor} {secondaryBtnBackColor} {secondaryBtnTextColor} {marketing} {labelName} {labelShort} {labelEmail} {labelAbout} {labelSloganLine1} {labelSloganLine2} {labelPrimaryOffering} />

	<Footer appId={appId} esApp={esApp} domainId={domainId} {coverBackColor} {coverTextColor} {labelName} {labelAbout} {labelPrimaryOffering} />
{/if}