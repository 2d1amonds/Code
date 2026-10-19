import { Module } from '@nestjs/common';
import { CustomersModule } from './customers/customers.module.js';
import { UsersModule } from './users/users.module.js';

@Module({
  imports: [CustomersModule, UsersModule],
  controllers: [],
  providers: [],
})
export class AppModule {}
