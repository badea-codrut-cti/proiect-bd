import { validateId } from "$lib/server/helpers";
import { deleteGenreEntry } from "$lib/server/mandb";
import type { RequestEvent } from "@sveltejs/kit";

export async function DELETE(event: RequestEvent) {
    let songId = validateId(event.url.searchParams.get("songId"));
    let genreId = validateId(event.url.searchParams.get("genreId"));

    if (!songId || !genreId)
        return new Response(
            JSON.stringify({
                success: false,
                reason: "songId si genreId sunt campuri obligatorii."
            })
        );

    if (!event.locals.isAdmin)
            return new Response(
                JSON.stringify({
                    success: false,
                    reason: "Insufficient permissions."
                })
            );

    return new Response(JSON.stringify(await deleteGenreEntry(songId, genreId)));
}