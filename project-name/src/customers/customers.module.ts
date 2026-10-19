import { MiddlewareConsumer, Module, NestModule, RequestMethod } from '@nestjs/common';
import { CustomersController } from './controllers/customers/customers.controller.js';
import { CustomersService } from './services/customers/customers.service.js';
import { ValidateCustomerMiddleware } from './middleware/validate-customer.middleware.js';
import { ValidateCustomeAccountMiddleware } from './middleware/validate-customer-account.middleware.js';
import { NextFunction, Request, Response } from 'express';

@Module({
  controllers: [CustomersController],
  providers: [CustomersService]
})
export class CustomersModule implements NestModule {
  configure(consumer: MiddlewareConsumer) {
    consumer
      .apply(
        ValidateCustomerMiddleware,
        ValidateCustomeAccountMiddleware,
        (req: Request, res: Response, next: NextFunction) => {
          console.log('Last Middleware');
          next();
        },
      )
      .exclude(
        {
          path: 'api/customers/create',
          method: RequestMethod.POST,
        },
        {
          path: 'api/customers',
          method: RequestMethod.GET,
        }
      )
      .forRoutes(CustomersController);
  }
}
