# unitty_server

### commands list

#### sequelize
> must starts always with "npx sequelize-cli"

    npx sequelize-cli init //initialize basic structure
    npx sequelize-cli model:generate --name User --attributes username:string,email:string,password:string
    
##### migrations
    npx sequelize-cli db:migrate //migrate command
    npx sequelize-cli db:migrate:undo //delete last migration
    npx sequelize-cli db:migrate:undo:all //deletet all migrations

##### seeders
    npx sequelize-cli seed:generate --name seed-name //create a seed
    npx sequelize-cli db:seed:all //run all seeds
    sequelize-cli db:seed:undo //delete last seed
    sequelize-cli db:seed:undo:all //delete all seeds

##### database
    npx sequelize-cli db:create //create the database
    npx sequelize-cli db:drop
    npx sequelize-cli help

### packages

#### server

"bcrypt": "^6.0.0",
"dotenv": "^17.2.3",
"express": "^5.1.0",
"fs": "^0.0.1-security",
"mysql2": "^3.15.1",
"path": "^0.12.7",
"sequelize": "^6.37.7"

#### client

"axios": "^1.12.2",
"react": "^19.1.1",
"react-dom": "^19.1.1",
"react-router-dom": "^7.9.3"