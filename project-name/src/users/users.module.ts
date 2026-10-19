import { Module } from '@nestjs/common';
import { UsersController } from './controllers/users/users.controller.js';
import { UsersService } from './service/users/users.service.js';

@Module({
    controllers: [UsersController],
    providers: [
        {
            provide: 'USER_SERVICE',
            useClass: UsersService,
        },
    ],
})
export class UsersModule {}
