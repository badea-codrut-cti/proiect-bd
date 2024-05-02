<script lang="ts">
    import CoverSide from "$lib/client/components/CoverSide.svelte";
    import SongEntry from "$lib/client/components/SongEntry.svelte";    
    import Taglist from "$lib/client/components/Taglist.svelte";

    export let data;

    function deleteSong(songId: number) {
        fetch(`/api/songs/del?songId=${songId}`, {
            method: "DELETE"
        });
    }
</script>

<CoverSide poza={data.album.url_coperta ? `poze/${data.album.url_coperta}.png` : "icons/trupa.png"} titlu={data.album.nume}>
    {#if data.album.oficial}
        <img class="inline-block h-6 w-6 text-green-500 ml-2" src="icons/verified.svg" alt="verified"/>
    {/if}
    <p>Data Lansare: {data.album.data_lansare.toLocaleDateString("en-GB")}</p>
    <a href={`/trupe?id=${data.album.trupa}`} class="text-blue-800 hover:text-blue-600">Trupa</a>
    {#if data.genuri.length}
        <h1 class="text-xl font-bold text-gray-800">Genuri</h1>
        <Taglist genuri={data.genuri}/>
    {/if}
    <button on:click={() => {
        fetch(`/api/album/del?albumId=${data.album.id}`, {
            method: "DELETE"
        });
    }}><img src="/icons/delete.svg" class="w-8" alt="delete-icon"/></button>
</CoverSide>

<br>

{#each data.melodii as melodie}
    <button on:click={() => {deleteSong(melodie.id)}}>
        <img src="/icons/delete.svg" class="w-8" alt="delete-icon"/>
    </button>
    <SongEntry melodie={melodie} url_coperta={data.album.url_coperta}/>
{/each}