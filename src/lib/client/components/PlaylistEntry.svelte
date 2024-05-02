<script lang="ts">
    import type { Playlist } from "$lib/types/database";

    export let playlist: Playlist & {data_modificat?: Date};
</script>

<a href={`/playlist?id=${playlist.id}`}>{playlist.nume}</a>
