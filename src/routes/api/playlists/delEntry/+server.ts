import { getPlaylist } from "$lib/server/fetchdb";
import { validateId } from "$lib/server/helpers";
import { deletePlaylistEntry } from "$lib/server/mandb";
import type { RequestEvent } from "@sveltejs/kit";

export async function DELETE(event: RequestEvent) {
    let playlistId = validateId(event.url.searchParams.get("playlistId"));
    let pozitie = validateId(event.url.searchParams.get("pozitie"));

    if (!playlistId || !pozitie)
        return new Response(
            JSON.stringify({
                success: false,
                reason: "pozitie si playlistId sunt campuri obligatorii."
            })
        );

    let playlist = await getPlaylist(playlistId);

    if (!playlist)
        return new Response(
            JSON.stringify({
                success: false,
                reason: "Playlist does not exist."
            })
        );

    if (!event.locals.isAdmin && event.locals.userId != playlist.creator)
            return new Response(
                JSON.stringify({
                    success: false,
                    reason: "Insufficient permissions."
                })
            );
        
    return new Response(JSON.stringify(await deletePlaylistEntry(playlistId, pozitie)));
}