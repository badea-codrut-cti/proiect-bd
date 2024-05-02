<script lang="ts">
    import AlbumEntry from "$lib/client/components/AlbumEntry.svelte";
    import CoverSide from "$lib/client/components/CoverSide.svelte";

    export let data;
</script>

<div>
    <CoverSide poza={data.trupa.url_poza ? `poze/${data.trupa.url_poza}.png` : "icons/trupa.png"} titlu={data.trupa.nume}   >
        {#if data.trupa.oficial}
            <img class="inline-block h-6 w-6 text-green-500 ml-2" src="icons/verified.svg" alt="verified"/>
        {/if}

        <p>Data Infiintare: {data.trupa.data_lansare.toLocaleDateString("en-GB")}</p>

        {#if data.trupa.website}
            <a href={data.trupa.website} class="text-blue-800 hover:text-blue-600">Website</a>
        {/if}
    </CoverSide>
    
    {#if data.membri.length}
        <h1 class="text-xl font-bold text-gray-800">Membri</h1>
        {#each data.membri as membru}
            <div class="inline-block mr-3">
                <div class="rounded-full w-16 h-16 overflow-hidden">
                    <img class="object-scale-down" 
                    src={membru.url_poza ? `poze/${membru.url_poza}.png` : "icons/poza_artist.png"} 
                    alt="poza-profil"/>
                </div>
                <a 
                class={membru.data_plecare_min ? "text-gray-600" : "text-gray-800"} 
                href={"/cantareti?id=" + membru.cantaret}>
                    {membru.nume} {membru.prenume}
                </a>
            </div>
        {/each}
    {/if}

    <button on:click={() => {
        fetch(`/api/bands/del?bandId=${data.trupa.id}`, {
            method: "DELETE"
        });
    }}><img src="/icons/delete.svg" class="w-8" alt="delete-icon"/></button>
</div>

{#if data.albume.length}
    <h1 class="text-xl text-gray-800">Albume</h1>
    {#each data.albume as album}
    <button class="inline-block" on:click={() => {
        fetch(`/api/album/del?albumId=${album.id}`, {
            method: "DELETE"
        });
    }}><img src="/icons/delete.svg" class="w-8" alt="delete-icon"/></button>
        <AlbumEntry album={album}/>
    {/each}
{/if}
