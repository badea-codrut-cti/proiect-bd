import { error } from "@sveltejs/kit";

export function validateId(idstr: string | null) {
    if (!idstr)
        throw error(400, 'Nu este precizat id-ul');

    if (Number.isNaN(idstr))
        throw error(400, 'Id-ul nu este un numar');

    return parseInt(idstr);
}

export function undefinedCast(data: string | null) {
    return data == null ? undefined : data;
}