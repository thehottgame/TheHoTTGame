¬isSetS¹ : isSet S¹ → ⊥
¬isSetS¹ = {!!}

¬isPropS¹ : isProp S¹ → ⊥
¬isPropS¹ = {!!}

-------------solutions------
¬isSetS¹ : isSet S¹ → ⊥
¬isSetS¹ h = Refl≢loop (h base base Refl loop)

¬isPropS¹ : isProp S¹ → ⊥
¬isPropS¹ h = ¬isSetS¹ (isProp→isSet h)
