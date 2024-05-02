<script lang="ts">
    import CoverSide from "$lib/client/components/CoverSide.svelte";
    import PlaylistEntry from "$lib/client/components/PlaylistEntry.svelte";

    export let data;
</script>

<CoverSide poza={data.utilizator.url_poza ? `poze/${data.utilizator.url_poza}.png` : `icons/utilizator.png`}
 titlu={data.utilizator.username}>
    <p>Data inregistrare: {data.utilizator.data_inregistrare.toLocaleDateString("en-GB")}</p>
    {#if data.utilizator.data_nasterii}
        <p>Data nasterii: {data.utilizator.data_nasterii.toLocaleDateString("en-GB")}</p>
    {/if}
</CoverSide>

<h1 class="text-xl">Playlisturi</h1>
{#each data.playlisturi as playlist}
    <PlaylistEntry playlist={playlist}/>
{/each}