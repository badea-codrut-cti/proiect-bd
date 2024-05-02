<script lang="ts">
    import type { GenMelodie } from "$lib/types/database";

    export let genuri: GenMelodie[], melodie: number | undefined = undefined;

    function deleteGenEntry(genId: number) {
        fetch(`/api/songs/delGenre?songId=${melodie}&genreId=${genId}`, {
            method: "DELETE"
        });
    }
</script>

{#each genuri as gen}
    <div class="hov-taglist-el inline-block bg-blue-500 px-2 mr-2 py-1
    text-white rounded border border-blue-200">
        <a href={`/genuri?id=${gen.id}`} >{gen.eticheta}</a>
        {#if melodie !== undefined}
            <!-- svelte-ignore a11y-click-events-have-key-events -->
            <!-- svelte-ignore a11y-no-static-element-interactions -->
            <span class="hov-taglist-cross" on:click={() => {deleteGenEntry(gen.id)}}>DELETE</span>
        {/if}
    </div>
{/each}

<style>
    .hov-taglist-el:hover .hov-taglist-cross {
        width: auto;
    }

    .hov-taglist-el .hov-taglist-cross {
        width: 0;
        overflow: hidden;
        float: right;
        margin-top: -0.5rem;
    }
</style>