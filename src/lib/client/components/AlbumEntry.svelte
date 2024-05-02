<script lang="ts">
    import type { Album } from "$lib/types/database";

    export let album: Album;
</script>

<a href={`/albume?id=${album.id}`} class="block items-center">
    <div class="inline-block mr-3 w-16 h-16 overflow-hidden">
        <img 
        src={album.url_coperta ? `poze/${album.url_coperta}.png` : "icons/album.png"} 
        class="object-scale-down" alt="coperta-album"/>
    </div>
    <span class="inline-block">{album.nume}</span>
</a>