'use strict';
/** @type {import('sequelize-cli').Migration} */
module.exports = {
  async up(queryInterface, Sequelize) {
    await queryInterface.createTable('Users', {
      name: {
        type: Sequelize.STRING(255),
        allowNull: false
      },
      email: {
        type: Sequelize.STRING(255),
        allowNull: false,
        unique: true
      },
      password: {
        type: Sequelize.STRING(255),
        allowNull: false
      },
      birth_date: {
        type: Sequelize.DATEONLY,
        allowNull: false
      },
      description: {
        type: Sequelize.TEXT,
        allowNull: false
      },
      dark_mode: {
        type: Sequelize.BOOLEAN,
        allowNull: false,
        defaultValue: false
      },
      location_id: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      occupation_id: {
        type: Sequelize.INTEGER,
        allowNull: false
      },
      photo: {
        type: Sequelize.STRING(255),
        allowNull: false
      },
      banner: {
        type: Sequelize.STRING(255),
        allowNull: false
      },
      createdAt: {
        allowNull: false,
        type: Sequelize.DATE
      },
      updatedAt: {
        allowNull: false,
        type: Sequelize.DATE
      }
    });
  },
  async down(queryInterface, Sequelize) {
    await queryInterface.dropTable('Users');
  }
};