# MATLAB HS13 – Research Plan (Template)  CHANGEEE101

(text between brackets to be removed)

> Fishy03

> Naterop Luca, Prasad Nishant, Petrides Ioannis

> Testing swarm models for different population sizes and influential neighbours

## General Introduction

In a very general sense, the term swarm is usually meant to signify a group of objects (agents) that interact with one another and have a collective goal. It has long been recognized that such interactive, cooperative behaviour within biological swarms is advantageous in avoiding predators or, vice versa, in capturing prey.

A lot of researchers have dabbled with modelling swarm behaviour in the past, not only to attempt to truly reflect actual swarm behaviour, but also to look into the applicability of this concept towards innovations in the real world that involve decentralized organisation, like cooperative robotics, vehicle navigation, optimization techniques, telecommunication network design, and the likes.

While going through different research articles, we found that a lot of them assumed that swarm population size and number of influential neighbours were relatively insignificant parameters contributing to overall swarm dynamics – which may be true for small swarms, but we want to test this notion for relatively larger population sizes, since we intuitively feel that they could heavily influence swarm properties like overall velocity, response time towards external forces and swarm splitting characteristics.

We will therefore use a purely mechanistic mathematical model (ignoring other custom swarm “rules”), and run the same over wide ranges of population, and number of influential neighbours as a fraction of total population, to gain a broader understanding on the significance of such factors towards overall swarm behaviour.

(States your motivation clearly: why is it important / interesting to solve this problem?)

(Add real-world examples, if any)

(Put the problem into a historical context, from what does it originate? Are there already some proposed solutions?)

## The Model

In our model, a swarm consists of a group of objects (agents), interacting with each other using forces. One force will act between members of the swarm, repelling agents at short distances and attracting at large distances. A swarm member won't be influenced by each member, but only by those who do not exceed a given neighbourhood distance. A second force attracts the agents to a source of food; and a third, repelling only on short distances, makes sure the agents do not collide with objects in the environment. Since we consider fish swarms, we have to include water resistance as an additional force.

Agents are considered as point masses in a two-dimensional, continuous world with open boundary. In every cycle of computation, positions, velocities and accelerations are changed due to the forces mentioned above.

Variables we want to study:

Independent Variables:

- Population size (number of agents)

- Neighbourhood distance: maximum distance of an influental neighbour

Dependent Variables:

- Interaction forces:  Member-member-forces and member-environment-forces

- Acceleration, velocity and position of agents,

- Cohesiveness: (1/A, where A is the smallest circle around all members of a swarm)

- Splitting number: amount of independent subgroups.


(Define dependent and independent variables you want to study. Say how you want to measure them.) (Why is your model a good abtraction of the problem you want to study?) (Are you capturing all the relevant aspects of the problem?)


## Fundamental Questions

    How does the population distribution change with varying number of influential neighbours?

        is there a change in the behaviour of the swarn (i.e. when persuing food)?

        Do individual agents get isolated by the rest?

        What is the evolution of the standard deviation of the population distribution.

    How is the spread function modified by population size?

        How does the average distance between agents change with increasing population?

        What is the evolution of the swarm in an environment with objects (i.e food & obstecles)?

            Does it have a characteristic or chaotic evolution?

            Are there any particular formations prefered?




Neighbourhood: maximum distances of influential neighbours as a fraction of swarm spread.

Change in behaviour with respect to different neighbourhoods?

(Spread function is the smallest area that all fishes can fit in.)

-Cohesiveness of swarm in absence of objects. (Cohesiveness: 1/A, where A is the area of the smallest circle around the swarm)

-Splitting characteristics of swarm in presence of objects. (object: obstecle or food)

-Single/multiple objects.




(At the end of the project you want to find the answer to these questions)

(Formulate a few, clear questions. Articulate them in sub-questions, from the more general to the more specific. )


## Expected Results

Even though the number of influential neighbours may be insignificant at low population numbers, we expect a high dependence for larger numbers.

The coheciveness (which we define as c=1/A, where A is the area of the smallest circle enclosing all agents) should initially increase drastically with growing population number, and eventually aproach a constant value. In addition, formation characteristics (such as splitting into subgroups) are anticipated for large populations.

By increasing the number of influential neighbours we assume stronger bondings, thus we expect a lower probability of certain characteristics such as splitting into subgroups and secluded agents.

Increase of cohesiveness for increase neibhbourhood.

Increased chance of splitting up in presence of objects with increase of neighbourhood.

For different population sizes, the product of cohesiveness and population (1/densitiy) should be constant for constant neighbourhood.

(What are the answers to the above questions that you expect to find before starting your research?)


## References

    T.I. Zohdi, “Mechanistic Modeling of Swarms”, Comput. Methods Appl. Mech. Engrg. 198 (2009) 2039–2051

(Add the bibliographic references you intend to use)

(Explain possible extension to the above models)

(Code / Projects Reports of the previous year)


## Research Methods

Agent-Based Model,

## Other

(mention datasets you are going to use)


