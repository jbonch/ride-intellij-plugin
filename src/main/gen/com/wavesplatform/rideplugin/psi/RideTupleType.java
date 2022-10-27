// This is a generated file. Not intended for manual editing.
package com.wavesplatform.rideplugin.psi;

import java.util.List;
import org.jetbrains.annotations.*;
import com.intellij.psi.PsiElement;

public interface RideTupleType extends RideCompositeElement {

  @NotNull
  List<RideArrayType> getArrayTypeList();

  @NotNull
  List<RideSimpleType> getSimpleTypeList();

  @NotNull
  List<RideTupleType> getTupleTypeList();

  @NotNull
  List<RideUnionType> getUnionTypeList();

}