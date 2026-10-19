import { Injectable } from '@nestjs/common';
import { SerializedUser, User } from '../../types/index.js';

@Injectable()
export class UsersService {
    private users: User[] = [
    {
        username: 'anson',
        password: 'anson123',
    },
    {
        username: 'danny',
        password: 'danny2000&',
    },
    {
        username: 'derek',
        password: 'kered',
    },
    {
        username: 'samantha',
        password: 'admin123',
    },
];
    getUsers() {
        return this.users.map((user) => new SerializedUser(user));
    }

    getUserByUsername(username: string) {
        return this.users.find((user) => user.username === username);
    }
}