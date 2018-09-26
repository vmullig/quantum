﻿namespace grover_packer
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Primitive;

    /// @brief Measure a bunch of qubits, and invert the states of those that don't match a desired state so that they do.
    /// @details Modified from code that was shamelessly copied from the Q# documentation.
    operation MultiSet ( desired: Result[], qbits: Qubit[] ) : ()
    {
        body
        {
            AssertIntEqual(Length(desired), Length(qbits), "The two registers provided to MultiSet must be equal.");
            //mutable current = new Result[ Length(qbits) ];
            //for( i in 0 .. Length(qbits) - 1 ) {
            //    set current[i] = M(qbits[i]);
            //}
            //for( i in 0 .. Length(desired) - 1 ) {
            //    if( desired[i] != current[i] ) {
            //        X(qbits[i]);
            //    }
            //}
        }
    }

    /// @brief Measure a qubit, and invert its state if it doesn't match a desired state so that it does.
    /// @details Shamelessly copied from the Q# documentation.
    //operation Set (desired: Result, q1: Qubit) : ()
    //{
    //    body
    //    {
    //        let current = M(q1);
    //        if (desired != current)
    //        {
    //            X(q1);
    //        }
    //    }
    //}

    /// @brief Given an array of classical bits representing a particular state and an array of classical bits representing the energy
    /// of that state, do a controlled addition of that energy (controlled by a qubit array representing the actual superposition of
    /// states of the system) to an array of qubits representing the superposition of energies of states of the system.
    operation SingleStateAdder ( state_bitstring: Result[], state_energy: Result[], state_qstring: Qubit[], total_energy: Qubit[] ) : ()
    {
        body
        {
            //Microsoft.Quantum.Canon.Add( state_energy, total_energy );
        }
    }

    operation TestAdder() : () {
        body {
                Result[] state_to_add = new Result[2] {Zero, Zero};
                Result[] energy_to_add = new Result[]{ Zero, One, One, Zero };
                Qubit[] curstate = new Qubit[2];
                Qubit[] curenergy = new Qubit[4];

                SingleStateAdder.Run( state_to_add, energy_to_add, curstate, curenergy);

                //Clean up: reset all qubits to |0> :
                Result[] endstate1 = new Result[]{ Zero, Zero };
                Result[] endstate2 = new Result[]{ Zero, Zero, Zero, Zero };
                MultiSet.Run(endstate1, curstate);
                MultiSet.Run(endstate2, curenergy);


                
        }
    }

 }
