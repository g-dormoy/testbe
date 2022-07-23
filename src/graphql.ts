
/*
 * -------------------------------------------------------
 * THIS FILE WAS AUTOMATICALLY GENERATED (DO NOT MODIFY)
 * -------------------------------------------------------
 */

/* tslint:disable */
/* eslint-disable */
export interface Project {
    name?: Nullable<string>;
}

export interface IQuery {
    project(): Nullable<Project> | Promise<Nullable<Project>>;
}

export interface Manufacturer {
    id: number;
    name: string;
    equipments: Nullable<Equipment>[];
}

export interface Equipment {
    id: number;
    name: string;
    manufacturer: Manufacturer;
    kwh: number;
    cost: number;
}

type Nullable<T> = T | null;
