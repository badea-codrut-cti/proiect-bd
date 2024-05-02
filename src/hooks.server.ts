export async function handle({ event, resolve }) {
    event.locals = {
        userId: 1,
        isAdmin: true
    };

    return await resolve(event);
}