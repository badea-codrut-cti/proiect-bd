import { validateId } from "$lib/server/helpers";
import { deleteById } from "$lib/server/mandb";
import type { RequestEvent } from "@sveltejs/kit";

export async function DELETE(event: RequestEvent) {
    let bandId = validateId(event.url.searchParams.get("bandId"));
    if (!bandId)
        return new Response(
            JSON.stringify({
                success: false,
                reason: "bandId e camp obligatoriu."
            })
        );

    if (!event.locals.isAdmin)
            return new Response(
                JSON.stringify({
                    success: false,
                    reason: "Insufficient permissions."
                })
            );

    return new Response(JSON.stringify(await deleteById("trupe", bandId)));
}