import { getPlaylist } from "$lib/server/fetchdb";
import { validateId } from "$lib/server/helpers";
import { deleteById } from "$lib/server/mandb";
import type { RequestEvent } from "@sveltejs/kit";

export async function DELETE(event: RequestEvent) {
    let playlistId = validateId(event.url.searchParams.get("playlistId"));
    if (!playlistId)
        return new Response(
            JSON.stringify({
                success: false,
                reason: "playlistId e camp obligatoriu."
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

    return new Response(JSON.stringify(await deleteById("playlisturi", playlistId)));
}