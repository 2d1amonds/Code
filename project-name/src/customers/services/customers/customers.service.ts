import { Injectable } from '@nestjs/common';
import { CreateCustomerDto } from '../../dtos/CreateCustomer.dto.js';
import { Customer } from '../../types/Customer.js';

@Injectable()
export class CustomersService {

    private customers: Customer[] = [
        {
            id: 1,
            email: 'danny@gmail.com',
            name: 'Danny Danny',
        },
        {
            id: 2,
            email: 'john@gmail.com',
            name: 'John John',
        },
        {
            id: 3,
            email: 'spencer@gmail.com',
            name: 'Spencer Spencer'
        },
    ];

    findCustomerByID(id:number) {
        return this.customers.find((user) => user.id === id);
    }

    createCustomer(customerDto: CreateCustomerDto) {
        this.customers.push(customerDto)
    }

    getCustomers() {
        return this.customers;
    }
}