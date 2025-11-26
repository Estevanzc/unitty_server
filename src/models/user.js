'use strict';
const {
  Model
} = require('sequelize');
module.exports = (sequelize, DataTypes) => {
  class User extends Model {
    static associate(models) {
    }
  }
  User.init({
    name: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    email: {
      type: DataTypes.STRING(255),
      allowNull: false,
      unique: true
    },
    password: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    birth_date: {
      type: DataTypes.DATEONLY,
      allowNull: false
    },
    description: {
      type: DataTypes.TEXT,
      allowNull: false
    },
    dark_mode: {
      type: DataTypes.BOOLEAN,
      allowNull: false,
      defaultValue: false
    },
    location_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    occupation_id: {
      type: DataTypes.INTEGER,
      allowNull: false
    },
    photo: {
      type: DataTypes.STRING(255),
      allowNull: false
    },
    banner: {
      type: DataTypes.STRING(255),
      allowNull: false
    }
  }, {
    sequelize,
    modelName: 'User',
  });
  return User;
};
