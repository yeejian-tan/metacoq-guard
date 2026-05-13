# Rocq's guard checker implemented in MetaRocq

This repository contains the guard checker of Rocq implemented in Rocq,
using the MetaRocq project, as part of Yee-Jian Tan's M1 internship in Cambium, Inria Paris,
supervised by Yannick Forster.

## Installation
```sh
opam switch create MetaRocq-guard --packages="ocaml-variants.4.14.1+options,ocaml-option-flambda"
eval $(opam env --switch=MetaRocq-guard)
opam repo add rocq-released https://rocq.inria.fr/opam/released
opam pin -n -y "https://github.com/MetaRocq/MetaRocq.git#v1.3.2-8.19"
opam install rocq-MetaRocq-template rocq-MetaRocq-utils
make -j
```

## Usage

```rocq
From MetaRocq.Guarded Require Import plugin.
From MetaRocq Require Import Utils.bytestring.

Open Scope bs.

(* define your fixpoint *)
Fixpoint add (m n : nat) : nat :=
  match m with
  | O => n
  | S m' => add m' (S n)
  end.

MetaRocq Run (check_fix add).
(* accepts a boolean flag on the expected guardedness. *)
MetaRocq Run (check_fix_ci true add).
```

## Credits

This project is based on https://github.com/lgaeher/MetaRocq/blob/guarded/README_project.md.

