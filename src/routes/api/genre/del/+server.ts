import { validateId } from "$lib/server/helpers";
import { deleteById } from "$lib/server/mandb";
import type { RequestEvent } from "@sveltejs/kit";

export async function DELETE(event: RequestEvent) {
    let genreId = validateId(event.url.searchParams.get("genreId"));
    if (!genreId)
        return new Response(
            JSON.stringify({
                success: false,
                reason: "genreId e camp obligatoriu."
            })
        );

    if (!event.locals.isAdmin)
            return new Response(
                JSON.stringify({
                    success: false,
                    reason: "Insufficient permissions."
                })
            );

    return new Response(JSON.stringify(await deleteById("genuri", genreId)));
}