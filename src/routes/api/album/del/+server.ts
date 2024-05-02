import { validateId } from "$lib/server/helpers";
import { deleteById } from "$lib/server/mandb";
import type { RequestEvent } from "@sveltejs/kit";

export async function DELETE(event: RequestEvent) {
    let albumId = validateId(event.url.searchParams.get("albumId"));
    if (!albumId)
        return new Response(
            JSON.stringify({
                success: false,
                reason: "albumId sunt campuri obligatorii."
            })
        );

    if (!event.locals.isAdmin)
            return new Response(
                JSON.stringify({
                    success: false,
                    reason: "Insufficient permissions."
                })
            );

    return new Response(JSON.stringify(await deleteById("albume", albumId)));
}