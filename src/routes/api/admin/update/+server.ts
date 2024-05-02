import { asyncQuery } from "$lib/server/database";
import { validateId } from "$lib/server/helpers";
import type { RequestEvent } from "@sveltejs/kit";

export async function POST(event: RequestEvent) {
    let table = event.url.searchParams.get("table");
    let elementId = validateId(event.url.searchParams.get("elementId"));

    if (!table || !elementId)
        return new Response(
            JSON.stringify({
                success: false,
                reason: "Table and element ID must be specified."
            })
        );

    if (!event.locals.isAdmin)
            return new Response(
                JSON.stringify({
                    success: false,
                    reason: "Insufficient permissions."
                })
            );

    let updater = await event.request.json();

    let updateParsed = Object.keys(updater).filter(el => updater[el] != 'undefined').map(el => {
        return `${el} = '${updater[el]}'`;
    });

    await asyncQuery(`UPDATE ${table} SET ${updateParsed.join(", ")} WHERE id=?`, [elementId]);
    return new Response(
        JSON.stringify({
            success: true
        })
    );
}