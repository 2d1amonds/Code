import { ClassSerializerInterceptor, Controller, Get, HttpException, HttpStatus, Inject, Param, UseInterceptors } from '@nestjs/common';
import { UsersService } from '../../service/users/users.service.js';
import { SerializedUser } from '../../types/index.js';

@Controller('users')
export class UsersController {
    constructor(
        @Inject('USER_SERVICE') 
        private readonly userService: UsersService,
    ) {}

    @UseInterceptors(ClassSerializerInterceptor)
    @Get('')
    getUsers() {
        return this.userService.getUsers();
    }

    @UseInterceptors(ClassSerializerInterceptor)
    @Get('/:username')
    getByUsername(@Param('username') username: string) {
        const user = this.userService.getUserByUsername(username);
        if (user) return new SerializedUser(user);
        else throw new HttpException('User not found', HttpStatus.BAD_REQUEST);
    }
}
