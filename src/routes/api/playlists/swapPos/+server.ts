import { getPlaylist } from "$lib/server/fetchdb";
import { validateId } from "$lib/server/helpers";
import { reorderPlaylist } from "$lib/server/mandb";
import type { RequestEvent } from "@sveltejs/kit";

export async function PUT(event: RequestEvent) {
    let playlistId = validateId(event.url.searchParams.get("playlistId"));
    let first = validateId(event.url.searchParams.get("first"));
    let second = validateId(event.url.searchParams.get("second"));

    if (!playlistId || !first || !second)
        return new Response(
            JSON.stringify({
                success: false,
                reason: "first, second si playlistId sunt campuri obligatorii."
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

    return new Response(JSON.stringify(await reorderPlaylist(playlistId, first, second)));
}