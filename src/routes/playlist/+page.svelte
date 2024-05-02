<script lang="ts">
    import SongEntry from "$lib/client/components/SongEntry.svelte";

    export let data;

    function deleteEntry(songPoz: number) {
        fetch(`/api/playlists/delEntry?playlistId=${data.playlist.id}&pozitie=${songPoz}`, {
            method: "DELETE"
        });
    }

    function swapEntries(first: number, second: number) {
        fetch(`/api/playlists/swapPos?playlistId=${data.playlist.id}&first=${first}&second=${second}`, {
            method: "PUT"
        });
    }

    let p1: number, p2: number;
</script>

<span>{data.playlist.nume}</span>

<div>
    <label for="poz1">Poz1</label>
    <input type="text" name="poz1" bind:value={p1}/>
    
    <br>
    <label for="poz2">Poz2</label>
    <input type="text" name="poz2" bind:value={p2}/>
    <br>
    <button on:click={() => {swapEntries(p1, p2)} }>Schimba</button>
</div>


<table class="min-w-full table-auto">
    <thead class="justify-between">
        <tr>
            <th class="w-8">Pozitie</th>
            <th class="">Melodie</th>
        </tr>
    </thead>
    <tbody>
        {#each data.melodii as melodie}
            <tr>
                <td>
                    {melodie.pozitie}
                    <button on:click={() => { deleteEntry(melodie.pozitie) }}>
                        <img src="icons/delete.svg" class="w-8" alt="delete-button"/>
                    </button>
                </td>
                <td>
                    <SongEntry melodie={melodie} url_coperta={melodie.url_coperta}/>
                </td>
            </tr>
        {/each}
    </tbody>
</table>