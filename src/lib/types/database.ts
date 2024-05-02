export const calitateAudio = ["MP3_320kbps", "MP3_128kbps", "FLAC_16bit", "FLAC_24bit", "FLAC_32bit"] as const;

export type Playlist = {
    id: number,
    nume: string,
    data_creat: Date,
    privat: boolean,
    ascultari: number,
    creator: number
};

export type Utilizator = {
    id: number,
    username: string,
    email: string,
    parola?: string,
    data_inregistrare: Date,
    data_nasterii?: Date,
    tara_origine?: string,
    url_poza?: string
};

export type GenMelodie = {
    id: number,
    eticheta: string,
    data_infiintat: Date,
    parinte?: number,
    url_emblema?: string
};

export type Cantaret = {
    id: number,
    nume: string,
    prenume: string,
    data_nastere: Date,
    tara_origine: string,
    website?: string,
    oficial: boolean,
    url_poza?: string
};

export type Melodie = {
    id: number,
    nume: string,
    album: number,
    ascultari: number,
    durata: number,
    calitate: typeof calitateAudio,
    data_lansare: Date,
    limba: string,
    explicit: boolean
};

export type Album = {
    id: number,
    trupa: number,
    nume: string,
    data_lansare: Date,
    oficial: boolean,
    url_coperta?: string
};

export type MembruTrupa = {
    cantaret: number,
    nume: string,
    prenume: string,
    url_poza?: string,
    data_intrare_min: Date,
    data_plecare_min: Date | undefined
};

export type Trupa = {
    id: number,
    nume: string,
    data_lansare: Date,
    tara_origine: string,
    website: string,
    oficial: boolean,
    url_poza?: string
};