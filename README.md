# CUFACT

## Custom Manufacturing Enterprise Platform

CUFACT is an enterprise platform for **custom plastic manufacturing**, initially focused on **Engineer-to-Order (ETO)** operations.

The project starts as a focused ERP around **Order Management** and progressively evolves into a broader enterprise platform covering quoting, pricing, production, data, machine learning, automation, and AI.

The goal is not to build a technology showcase. The goal is to build a coherent system and introduce complexity only when the business or technical requirements justify it.

## Architecture Vision

CUFACT is designed around two tightly integrated layers:

**Salesforce**
The primary enterprise interface where users interact with customers, products, orders, configurations, workflows, and business processes.

**AWS**
The operational backend responsible for services, processing, persistence, pricing, production workloads, data, and machine learning.

The two platforms communicate bidirectionally:

```text
                    CUFACT
                      │
          ┌───────────┴───────────┐
          │                       │
      Salesforce                AWS
    User / Business         Operational Backend
          │                       │
          │    Integration        │
          └───────────↔───────────┘
                                  │
                       ┌──────────┼──────────┐
                       │          │          │
                    Python    Data/ML    Production
                    Services  /SageMaker  Services
```

## Development Roadmap

The platform will be developed progressively through independent stages.

| Stage | Focus                               |
| ----- | ----------------------------------- |
| 1     | Salesforce Foundation               |
| 2     | Configuration & Quoting             |
| 3     | AWS Core Backend                    |
| 4     | Salesforce ↔ AWS Integration        |
| 5     | Python Pricing Engine               |
| 6     | Production Operations               |
| 7     | Data Platform & Analytics           |
| 8     | SageMaker & Predictive Intelligence |
| 9     | Automation & Agentforce             |
| 10    | Enterprise Architecture             |

The roadmap is intentionally flexible. Stages may be modified, reordered, expanded, or replaced as the system evolves.

## Initial Scope

The first version of CUFACT focuses on **Order Management**.

Initial flow:

```text
Customer
   ↓
Order
   ↓
Order Items
   ↓
Product / Configuration
   ↓
Production
   ↓
Status Updates
```

The first objective is to establish a strong Salesforce foundation and a functional order lifecycle before introducing more advanced infrastructure.

## Engineering Goals

CUFACT is also a practical engineering and architecture project.

The project will be used to explore:

* Enterprise data modeling
* Salesforce architecture
* API design
* Salesforce ↔ AWS integration
* Python backend development
* Distributed systems
* Synchronous and asynchronous processing
* Data ownership and synchronization
* Pricing engines
* Data pipelines
* Machine learning with SageMaker
* Automation
* Agentforce
* Security
* Observability
* Scalability
* Resilience and disaster recovery

## Development Philosophy

The project follows a simple principle:

> **Problem first. Technology second.**

We will not introduce a technology simply because it is interesting.

Instead:

```text
Problem
   ↓
Requirements
   ↓
Proposed Solution
   ↓
Architecture Decision
   ↓
Implementation
   ↓
Testing
   ↓
Review
   ↓
Iteration
```

Architectural decisions should be justified by the requirements of the system and should explicitly consider their trade-offs.

## Current Status

**Phase:** Initial development
**Current focus:** Order Management
**Domain:** Custom Plastic Manufacturing / ETO

### Next

Define and implement the initial CUFACT Salesforce data model and Order lifecycle.
