<script lang="ts">
    import CoverSide from "$lib/client/components/CoverSide.svelte";
    import Taglist from "$lib/client/components/Taglist.svelte";

    export let data;
</script>

<CoverSide poza={data.cantaret.url_poza ? `poze/${data.cantaret.url_poza}.png` : "icons/trupa.png"} titlu={`${data.cantaret.nume} ${data.cantaret.prenume}`}>
    {#if data.cantaret.oficial}
        <img class="inline-block h-6 w-6 text-green-500 ml-2" src="icons/verified.svg" alt="verified"/>
    {/if}
    <td class="w-16 inline-block">
        <img src={`icons/country-flags/svg/${data.cantaret.tara_origine.toLocaleLowerCase()}.svg`} 
        class="object-scale-down" alt="tara-origine"/>
    </td>

    <p>Data Nastere: {data.cantaret.data_nastere.toLocaleDateString("en-GB")}</p>
        
    {#if data.cantaret.website}
        <a href={data.cantaret.website} class="text-blue-800 hover:text-blue-600">Website</a>
    {/if}

    {#if data.genuri.length}
        <h1 class="text-xl font-bold text-gray-800">Genuri</h1>
        <Taglist genuri={data.genuri}/>
    {/if}

    <br>
    <button on:click={() => {
        fetch(`/api/artist/del?artistId=${data.cantaret.id}`, {
            method: "DELETE"
        });
    }}><img src="/icons/delete.svg" class="w-8" alt="delete-icon"/></button>
</CoverSide>

<h1 class="text-xl">Istoric Trupe</h1>
{#each data.istoric as ist}
    <div class="block">
        <img class="w-16 h-16 inline-block object-scale-down" src={`poze/${ist.url_poza}.png`}/>
        <p class="inline-block">{ist.nume}</p>
    </div>
{/each}