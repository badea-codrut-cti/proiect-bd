import { validateId } from "$lib/server/helpers";
import { deleteById } from "$lib/server/mandb";
import type { RequestEvent } from "@sveltejs/kit";

export async function DELETE(event: RequestEvent) {
    let songId = validateId(event.url.searchParams.get("songId"));
    if (!songId)
        return new Response(
            JSON.stringify({
                success: false,
                reason: "songId e camp obligatoriu."
            })
        );

    if (!event.locals.isAdmin)
            return new Response(
                JSON.stringify({
                    success: false,
                    reason: "Insufficient permissions."
                })
            );

    return new Response(JSON.stringify(await deleteById("melodii", songId)));
}