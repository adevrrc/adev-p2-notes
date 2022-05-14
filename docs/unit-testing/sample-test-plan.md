---
layout: default
title: Sample Test Plan
nav_exclude: true
---

# Test Plan

## Introduction

- Resource: Person Class
- Version: 1.0
- Created: 5/12/2022
- Last Updated: 7/21/2022
- Author(s): Kenny Omega

## Test Cases

### Person(string, decimal)

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Exception when name is null | Parameter name: null, Parameter amountOfMoney: 500 | ArgumentNullException, Parameter: name, Message: The argument must reference a string object. |
| 2 | Exception when the name has no characters | Parameter name: "", Parameter amountOfMoney: 500 | ArgumentException, Parameter: name, Message: The argument must contain at least 1 character. |
| 3 | Exception when the amount of money is a negative | Parameter name: "Kenny", Parameter amountOfMoney: -100 | ArgumentOutOfRangeException, Parameter: amountOfMoney, Message: The argument must be zero or greater. |
| 4 | Initialize the name | Parameter name: "Kenny", Parameter amountOfMoney: 500 | "Kenny" |
| 5 | Initialize the amount of money to zero | Parameter name: "Kenny", Parameter amountOfMoney: 0 | 0 |
| 6 | Initialize the amount of money to positive value | Parameter name: "Kenny", Parameter amountOfMoney: 500 | 500 |

### Person(string)

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Exception when name is null | Parameter name: null | ArgumentNullException, Parameter: name, Message: The argument must reference a string object. |
| 2 | Exception when the name has no characters | Parameter name: "" | ArgumentException, Parameter: name, Message: The argument must contain at least 1 character. |
| 3 | Initialize the name | Parameter name: "Kenny" | "Kenny" |
| 4 | Initialize the amount of money to zero | Parameter name: "Kenny" | 0 |

### <<Property>> AmountOfMoney : decimal

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Exception when the value is a negative value | Value: -1 | ArgumentOutOfRangeException, Parameter: value, Message: The value must be zero or greater., State is not updated. |
| 3 | Sets the amount of money to zero | Initial amount of money: 100, Value: 0 | 0 |
| 4 | Sets the amount of money to positive value | Initial amount of money: 0, Value: 100 | 100 |
| 5 | Gets the amount of money | Initial amount of money: 100 | 100 |

### <<Property>> Name : string

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Get the name | Initial name: "Kenny" | "Kenny" |

### AddMoney(decimal) : void

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Exception when the amount is a negative value | Initial amount of money: 0, Parameter amount: -1 | ArgumentOutOfRangeException, Parameter: amount, Message: The argument cannot be less than zero., State is not updated. |
| 2 | Add no money | Initial amount of money: 100, Parameter amount: 0 | Amount of money state: 100 |
| 3 | Add money | Initial amount of money: 100, Parameter amount: 60 | Amount of money state: 160 |

### SubtractMoney(decimal) : void

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Exception when the amount is a negative value | Initial amount of money: 0, Parameter amount: -1 | ArgumentOutOfRangeException, Parameter: amount, Message: The argument cannot be less than zero., State is not updated. |
| 2 | Exception when the amount is greater than the amount of money | Initial amount of money: 100, Parameter amount: 500 | ArgumentOutOfRangeException, Parameter: amount, Message: The argument cannot not exceed the amount of money the Person has., State is not updated. |
| 3 | Subtract no money | Initial amount of money: 100, Parameter amount: 0 | Amount of money state: 100 |
| 4 | Subtract money | Initial amount of money: 100, Parameter amount: 60 | Amount of money state: 40 |

### ToString() : string

| # | Test Case | Test Data | Expected |
|:-:|:--------|:---------|:---------|
| 1 | Return string representation of the Person | Initial name: Kenny, Initial amount of money: 123.45M | "Kenny - $123.45" |

**Total number of test cases: 23**