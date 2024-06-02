import 'dart:convert';
import 'package:equatable/equatable.dart';

class WoQuotationModel extends Equatable {
  final int? id, status, number, linkedOrderId, samplingUse, quotationNextId, isApprovedUser, orderId, isSampleReceived, pelangganId, groupId;
  final String? noQuotation, namaPelanggan, telepon, email, namaCp, tanggalPermintaan, suratRef, groupNama, catatanApproval, catatanApprovalCustomer;
  const WoQuotationModel({
    this.id,
    this.status,
    this.number,
    this.linkedOrderId,
    this.samplingUse,
    this.quotationNextId,
    this.isApprovedUser,
    this.orderId,
    this.isSampleReceived,
    this.pelangganId,
    this.groupId,
    this.noQuotation,
    this.namaPelanggan,
    this.telepon,
    this.email,
    this.namaCp,
    this.tanggalPermintaan,
    this.suratRef,
    this.groupNama,
    this.catatanApproval,
    this.catatanApprovalCustomer
  });
  
  @override
  List<Object?> get props => [
    id,
    status,
    number,
    linkedOrderId,
    samplingUse,
    quotationNextId,
    isApprovedUser,
    orderId,
    isSampleReceived,
    pelangganId,
    groupId,
    noQuotation,
    namaPelanggan,
    telepon,
    email,
    namaCp,
    tanggalPermintaan,
    suratRef,
    groupNama,
    catatanApproval,
    catatanApprovalCustomer
  ];

  WoQuotationModel copyWith({
    int? id, status, number, linkedOrderId, samplingUse, quotationNextId, isApprovedUser, orderId, isSampleReceived, pelangganId,
  String? noQuotation, namaPelanggan, telepon, email, namaCp, tanggalPermintaan, suratRef, groupNama, catatanApproval, catatanApprovalCustomer
  }) => WoQuotationModel(
    id: id ?? this.id,
    status: status ?? this.status,
    number: number ?? this.number,
    linkedOrderId: linkedOrderId ?? this.linkedOrderId,
    samplingUse: samplingUse ?? this.samplingUse,
    quotationNextId: quotationNextId ?? quotationNextId,
    isApprovedUser: isApprovedUser ?? this.isApprovedUser,
    orderId: orderId ?? this.orderId,
    isSampleReceived: isSampleReceived ?? this.isSampleReceived,
    pelangganId: pelangganId ?? this.pelangganId,
    noQuotation: noQuotation ?? this.noQuotation,
    namaPelanggan: namaPelanggan ?? this.namaPelanggan,
    telepon: telepon ?? this.telepon,
    email: email ?? this.email,
    namaCp: namaCp ?? this.namaCp,
    tanggalPermintaan: tanggalPermintaan ?? this.tanggalPermintaan,
    suratRef: suratRef ?? this.suratRef,
    groupNama: groupNama ?? this.groupNama,
    catatanApproval: catatanApproval ?? this.catatanApproval,
    catatanApprovalCustomer: catatanApprovalCustomer ?? this.catatanApprovalCustomer
  );

  factory WoQuotationModel.fromMap(Map<String, dynamic> m) => WoQuotationModel(
    id: m['id'] ?? 0,
    status: m['status'] ?? 0,
    number: m['number'] ?? 0,
    linkedOrderId: m['linked_order_id'] ?? 0,
    samplingUse: m['sampling_use'] ?? 0,
    quotationNextId: m['quotationnext_id'] ?? 0,
    isApprovedUser: m['is_approved_user'] ?? 0,
    orderId: m['order_id'] ?? 0,
    isSampleReceived: m['is_sample_received'] ?? 0,
    pelangganId: m['pelanggan_id'] ?? 0,
    groupId: m['group_id'] ?? 0,
    noQuotation: m['no_quotation'] ?? '',
    namaPelanggan: m['nama_pelanggan'] ?? '',
    telepon: m['telepon'] ?? '',
    email: m['email'] ?? '',
    namaCp: m['nama_cp'] ?? '',
    tanggalPermintaan: m['tanggal_permintaan'] ?? '',
    suratRef: m['surat_ref'] ?? '',
    groupNama: m['group_nama'] ?? '',
    catatanApproval: m['catatan_approval'] ?? '',
    catatanApprovalCustomer: m['catatan_approval_customer'] ?? ''
  );

  factory WoQuotationModel.fromString(String s) => WoQuotationModel.fromMap(jsonDecode(s));
}
