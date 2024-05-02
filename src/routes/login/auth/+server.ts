import { authUser } from "$lib/server/database";
import type { RequestEvent } from "@sveltejs/kit";
import { createHash } from "crypto";

export async function POST(event: RequestEvent) {
    let data = await event.request.formData();
    
    let username = data.get("username");
    let password = data.get("password");

    if (!username || !password)
        return new Response("400");

    let passwordHash = createHash("sha256").update(password.toString()).digest("hex");

    let userid = await authUser(username.toString(), passwordHash);

    if (!userid)
        return new Response("403");

    event.locals.userId = userid;

    return new Response("E bine a mers");
}