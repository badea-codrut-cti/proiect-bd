import { asyncQuery } from "$lib/server/database";
import { validateId } from "$lib/server/helpers";
import type { RequestEvent } from "@sveltejs/kit";

export async function GET(event: RequestEvent) {
    let table = event.url.searchParams.get("table");
    let orderBy = event.url.searchParams.get("orderBy");

    if (!table)
        return new Response(
            JSON.stringify({
                success: false,
                reason: "Table must be specified."
            })
        );

    if (!event.locals.isAdmin)
            return new Response(
                JSON.stringify({
                    success: false,
                    reason: "Insufficient permissions."
                })
            );

    let result = await asyncQuery(`SELECT * FROM ${table} ORDER BY ${orderBy}`, []);

    return new Response(
        JSON.stringify(
            result.map(el => {
                return {...el};
            })
        )
    );
}