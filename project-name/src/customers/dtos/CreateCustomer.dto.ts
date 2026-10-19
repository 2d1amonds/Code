import { IsEmail, IsNotEmpty, IsNotEmptyObject, IsNumberString, ValidateNested } from "class-validator";
import { CreateAddressDto } from "./CreateAdress.dto.js";
import { Type } from "class-transformer";

export class CreateCustomerDto {
    @IsNumberString()
    id: number;

    @IsEmail()
    email : string;

    @IsNotEmpty()
    name: string;

    @IsNotEmptyObject()
    @ValidateNested()
    @Type(() => CreateAddressDto)
    address: CreateAddressDto;
}