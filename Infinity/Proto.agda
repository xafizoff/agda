{-# OPTIONS --cubical --safe #-}
module Infinity.Proto where

open import Agda.Builtin.Sigma public renaming (fst to π⃐; snd to π⃑)
open import Agda.Builtin.Nat public using (zero; suc; _+_; _*_) renaming (Nat to ℕ)
open import Infinity.Core public

module _ {ℓ₁ ℓ₂ ℓ₃} {A : Set ℓ₁} where

  flip : ∀ {B : Set ℓ₂} {C : A → B → Set ℓ₃} → ((x : A) (y : B) → C x y) → ((y : B) (x : A) → C x y)
  flip f = λ y x → f x y

  infixr 80 _∘_

  _∘_ : ∀ {B : A → Set ℓ₂} {C : (a : A) → (B a → Set ℓ₃)}
          (g : {a : A} → (x : B a) → (C a x)) → (f : (x : A) → B x) → (x : A) → C x (f x)
  g ∘ f = λ x → g (f x)

  _⦂_ : ∀ {B : A → Set ℓ₂} {C : (a : A) → (B a → Set ℓ₃)} {D : (a : A) → (b : B a) → C a b → Set ℓ₃}
        → (g : {a : A} {b : B a} → (x : C a b) → D a b x) → (f : (x : A) → (y : B x) → C x y) → (x : A) → (y : B x) → D x y (f x y)
  g ⦂ f = λ x y → g (f x y)

apply : ∀ {ℓ} {A B : Set ℓ} (f : A → B) (x : A) → B
apply f x = f x

typeof : ∀ {ℓ} {A : Set ℓ} → A → Set ℓ
typeof {A = A} _ = A

record ⇑ {ℓ₁ ℓ₂} (X : Set ℓ₁) : Set (ℓ₁ ⊔ ℓ₂) where
    constructor ↑
    field ↓ : X

open ⇑ public

