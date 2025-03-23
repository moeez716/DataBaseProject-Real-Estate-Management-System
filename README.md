Real Estate Management System

Introduction

The Real Estate Management System is a database project designed to streamline property listings, client management, and transactions for real estate businesses. This system helps users manage properties, agents, and buyers efficiently.

Features

Property Listings (Residential, Commercial, Rental, Sale)

Buyer and Seller Management

Agent and Broker Information

Transactions and Payment Records

Search and Filtering Options

Technologies Used

Database: MySQL / PostgreSQL

Database Schema

The database consists of multiple interconnected tables to manage different aspects of real estate transactions.

Tables:

sales

SaleID (Primary Key)

ListingID (Foreign Key referencing listings)

ClientID (Foreign Key referencing clients)

SaleDate (Date of transaction)

SalePrice (Decimal value of sale)

rents

RentID (Primary Key)

ListingID (Foreign Key referencing listings)

ClientID (Foreign Key referencing clients)

StartDate, EndDate (Rental period)

RentAmount (Decimal value of rent)

landlords

LandlordID (Primary Key)

FirstName, LastName

Email, Phone

properties

PropertyID (Primary Key)

Address, City, State, PostalCode, Country

OwnerID (Foreign Key referencing landlords)

listings

ListingID (Primary Key)

PropertyID (Foreign Key referencing properties)

ListingType (ENUM: 'Sale', 'Rent')

Price (Decimal value of price)

ListingDate (Date of listing)

Status (ENUM for listing status)

ListingAgentID (Foreign Key referencing listing agents)

listings_agent

ListingAgentID (Primary Key)

FirstName, LastName

Email, Phone

commission

CommissionID (Primary Key)

AgentsCommission (Decimal value)

ListingAgentID (Foreign Key referencing listing agents)

ListingID (Foreign Key referencing listings)

clients

ClientID (Primary Key)

FirstName, LastName

Email, Phone

payments

PaymentID (Primary Key)

ClientID (Foreign Key referencing clients)

Amount (Decimal value of payment)

PaymentDate (Date of payment)

PaymentMethod (VARCHAR for method of payment)

ListingID (Foreign Key referencing listings)

maintenance_requests

RequestID (Primary Key)

PropertyID (Foreign Key referencing properties)

ClientID (Foreign Key referencing clients)

Description (TEXT)

RequestDate (Date of request)

Status (ENUM for request status)

Installation Steps

Clone the repository:

Import the database schema (SQL file) into MySQL.

Ensure the necessary database permissions are set up.

Usage

Admins can manage properties, agents, and transactions.

Buyers can search for properties and contact agents.

Agents can add new listings and manage client inquiries.

Future Enhancements

Advanced search and filtering

AI-powered property recommendations

Performance optimizations